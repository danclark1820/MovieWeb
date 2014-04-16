class Recommendation < ActiveRecord::Base

  def self.sim_pearson(user_1, user_2)
    #get list of mutually rated items
    mutually_rated={}
    user_1.ratings.pluck(:movie_id).each do |movie|
      if user_2.ratings.pluck(:movie_id).include?(movie)
        mutually_rated[movie] = 1
      end
    end

    n = mutually_rated.length

    if n==0
      0
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
    numerator = pSum - ( sum_1 * sum_2/n )
    denominator=( sum_1Sq - (sum_1**2)/n ) * ( sum_2Sq - (sum_2**2)/n )**(1/2)

    if denominator == 0
      0
    end

    r = numerator/denominator

    r
  end


  # def getReccomendations(user_ratings_hash, user)
  #   totals = {}
  #   simSums= {}
  #   user_ratings_hash.each do |person|
  #     if person == user
  #       continue
  #     end
  #     sim_pearson(user_ratings_hash, user, person)
  #     if sim <= 0
  #       continue
  #     end
  #     user_ratings_hash[person].each do |movie|
  #       #only score movies I haven't seen yet
  #       if movie not in user_ratings_hash[user] or user_ratings_hash[user][movie]==0
  #         #Similarity * Score
  #         totals.setdefault(item,0)
  #         totals[item]+=user_ratings_hash[person][movie]*sim
  #         #Sum of similarities
  #         simSums.setdefault(item,0)
  #         simSums[item]+=sim
  #       end

  #     #Create normalized list
  #     rankings=[(total/simSums[movie], movie)] for item, total in totals.item()]

  #     #Return sorted list
  #     rankings.sort()
  #     ranks.reverse()
  #     rankings

end
