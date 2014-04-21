module Recommendations

  def sim_pearson(user_1, user_2)
    similarity = Rating.find_by_sql "select corr(u1.stars, u2.stars)
      from ratings u1
        inner join ratings u2
          on u2.movie_id = u1.movie_id
        where u2.user_id = #{user_2.id} and u1.user_id = #{user_1.id};"

    similarity[0].corr

  end


  def getRecommendation(user)
    totals = {}
    simSums={}
    all_users = User.all
    all_users.each do |person|
      #don't compare users to themselves
      if person == user
        next
      end

      sim = sim_pearson(user, person)

      if sim == nil || sim <= 0
        next
      end

      person_ratings = User.where(id: person.id)[0].ratings
      user_ratings = user.ratings

      person_ratings.each do |rating|
        #only score movies user has not seen
        if !user_ratings.include?(rating)
          #Similarity * Score
          totals.default = 0
          totals[rating.movie_id] += rating.stars * sim
          #Sum of similarities
          simSums.default = 0
          simSums[rating.movie_id] += sim
        end

      end

    end
        #create the normalized list
        rankings = {}
        totals.each do |movie, sim_score_product|
          simSums.each do |movie_simSum, sim|
            rankings[movie] = sim_score_product/sim
          end
        end
        binding.pry
        rankings.sort_by{|k,v| v}.reverse

  end

end
