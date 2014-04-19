module Recommendations

  def sim_pearson(user_1, user_2)
    #get list of mutually rated items
    mutually_rated={}
    user_1.ratings.pluck(:movie_id).each do |movie|
      if user_2.ratings.pluck(:movie_id).include?(movie)
        mutually_rated[movie] = 1
      end
    end

    n = mutually_rated.length

    if n==0
      return 0
    end

    sum_1 = 0
    sum_2 = 0
    sum_1Sq = 0
    sum_2Sq = 0
    pSum = 0

    mutually_rated.each do |movie, value|
      sum_1 += user_1.ratings.where(movie_id: movie).pluck(:stars)[0]
      sum_1Sq += user_1.ratings.where(movie_id: movie).pluck(:stars)[0] ** 2
      sum_2 += user_2.ratings.where(movie_id: movie).pluck(:stars)[0]
      sum_2Sq += user_2.ratings.where(movie_id: movie).pluck(:stars)[0] ** 2
      pSum += user_1.ratings.where(movie_id: movie).pluck(:stars)[0] * user_2.ratings.where(movie_id: movie).pluck(:stars)[0]
    end


    #calculte pearson
    numerator = pSum - ( sum_1 * (sum_2/n).to_f )
    denominator=( sum_1Sq - ((sum_1**2)/n).to_f )**(0.5) * ( sum_2Sq - ((sum_2**2)/n).to_f )**(0.5)

    if denominator == 0
      r = 0
    else
     r = numerator/denominator
    end

    return r

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

      if sim <= 0
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

        rankings.sort_by{|k,v|}.reverse

  end

end
