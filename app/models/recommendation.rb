class Recommendation < ActiveRecord::Base

  def self.sim_pearson(user_ratings_hash, user_1, user_2)
    #get list of mutually rated items
    mutually_rated={}
    Rating.where(user_id: user_1).pluck(:movie_id).each do |movie_id|
      if Rating.where(user_id: user_2).pluck(:movie_id).include?(movie_id)
        mutually_rated[:movie_id] += 1
      end
    end
    # user_1.ratings.each do |movie|
    #   if user_2.ratings.include?(movie)
    #     mutually_rated[movie] = 1
    #   end
    # end

    #find the number of elements
    n = len(mutually_rated)

    if n==0
      0
    end

    user_1_ratings = user_1.ratings # need array of user_1 ratings for all movies in mutually rated
    user_2_ratings = user_2.ratings #

    #add up all preferences
    sum_1 = sum(user_1_ratings)
    sum_2 = sum(user_2_ratings)

    #add up all preferences squared
    sum_1Sq=sum(user_1_ratings.map(**2))
    sum_2Sq=sum(user_2_ratings.map(**2))

    #sum up products
    pSum = user_1_ratings * user_2_ratings for each in mutually_rated

    #calculte pearson
    numerator = pSum - ( sum_1 * sum_2/n )
    denominator=sqrt((sum_1Sq - sum1**2/n)) * (sum2_sq - sum_2**2/n))

    if denominator = 0
      0
    end

    r = numerator/denominator

    r
  end


  def getReccomendations(user_ratings_hash, user)
    totals = {}
    simSums= {}
    user_ratings_hash.each do |person|
      if person == user
        continue
      end
      sim_pearson(user_ratings_hash, user, person)
      if sim <= 0
        continue
      end
      user_ratings_hash[person].each do |movie|
        #only score movies I haven't seen yet
        if movie not in user_ratings_hash[user] or user_ratings_hash[user][movie]==0
          #Similarity * Score
          totals.setdefault(item,0)
          totals[item]+=user_ratings_hash[person][movie]*sim
          #Sum of similarities
          simSums.setdefault(item,0)
          simSums[item]+=sim
        end

      #Create normalized list
      rankings=[(total/simSums[movie], movie)] for item, total in totals.item()]

      #Return sorted list
      rankings.sort()
      ranks.reverse()
      rankings







end
