class ApplicationController < ActionController::Base
  def cuisinehuh
    biglist = Cuisine.all
    render({ :plain =>  biglist.to_json })
  end

  def disheshuh

    if params[:cuisine_id] == nil
      biglist = Dish.all
      render({ :plain =>  biglist.to_json })
    else
      title = params.fetch(:cuisine_id, "None provided")
      piratebooty = Dish.where({ :cuisine_id => title })
      render({ :plain =>  piratebooty.to_json })
    end  
  end  

  def disheswot
    title = params.fetch(:dishid)
    piratebooty = Dish.where({ :id => title }).at(0)
    render({ :plain =>  piratebooty.to_json })
  end  

  def neighborwhere
    biglist = Neighborhood.all
    render({ :plain =>  biglist.to_json })
  end

  def venuewot

    if params[:neighborhood_id] == nil
      biglist = Venue.all
    render({ :plain =>  biglist.to_json })
    else
      title = params.fetch(:neighborhood_id, "None provided")
      piratebooty = Venue.where({ :neighborhood_id => title })
      render({ :plain =>  piratebooty.to_json })
    end  

  end

  def userwot
    biglist = User.all
    render({ :plain =>  biglist.to_json })
  end

  def venuehuh
    title = params.fetch(:venueid)
    piratebooty = Venue.where({ :id => title }).at(0)
    render({ :plain =>  piratebooty.to_json })
  end

  def userhuh
    title = params.fetch(:userid)
    piratebooty = User.where({ :id => title }).at(0)
    render({ :plain =>  piratebooty.to_json })
  end

  def addbookmark
    userid = params.fetch(:input_user_id)
    dishid = params.fetch(:input_dish_id)
    venueid = params.fetch(:input_venue_id)
    blackbeard = Bookmark.new
    blackbeard.user_id = userid
    blackbeard.dish_id = dishid
    blackbeard.venue_id = venueid
    blackbeard.save
    render({:plain => "yummy"})  
  end  

  def userbookmark

    if params[:dish_id] == nil
      title = params.fetch(:userid)
      piratebooty = Bookmark.where({ :user_id => title })
      render({ :plain =>  piratebooty.to_json })
    else
      title = params.fetch(:userid)
      piratebooty = Bookmark.where({ :user_id => title })
      sauce = params.fetch(:dish_id, "None provided")
      pirategunship = piratebooty.where({ :dish_id => sauce })
      render({ :plain =>  pirategunship.to_json })
    end  
  end
  
  def dishbookmark
    title = params.fetch(:dishid)
    piratebooty = Bookmark.where({ :dish_id => title })
    render({ :plain =>  piratebooty.to_json })
  end

  def venuebookmark
    title = params.fetch(:venueid)
    piratebooty = Bookmark.where({ :venue_id => title })
    render({ :plain =>  piratebooty.to_json })
  end

  def nawbookmark
    destroy=params.fetch(:bookmarkid)
    plank=Bookmark.where({:id=>destroy}).at(0)
    plank.destroy
    render({:plain => "yummy but deadly"})
  end  

  def userdish
    babble=params.fetch(:userid)
    pirateship=Bookmark.where({:user_id => babble}).pluck(:dish_id)
    piratesauce = Dish.where({:id => pirateship})
    render({:plain => piratesauce.to_json})
  end

  def dishmaster
    babble=params.fetch(:dishid)
    pirateship=Bookmark.where({:dish_id => babble}).pluck(:venue_id)
    piratesauce = Venue.where({:id => pirateship})
    render({:plain => piratesauce.to_json})
  end

  def wottoeat
    babble=params.fetch(:venueid)
    pirateship=Bookmark.where({:venue_id => babble}).pluck(:dish_id)
    piratesauce = Dish.where({:id => pirateship})
    render({:plain => piratesauce.to_json})
  end

  def whoswho
    babble=params.fetch(:venueid)
    pirateship=Bookmark.where({:venue_id => babble}).pluck(:user_id)
    piratesauce = User.where({:id => pirateship})
    render({:plain => piratesauce.to_json})
  end  

end
