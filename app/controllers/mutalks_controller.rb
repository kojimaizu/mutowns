class MutalksController < ApplicationController
    before_action :require_user_logged_in
    before_action :correct_user, only: [:destroy, :show, :edit, :update]
    
    def index
        if logged_in?
            @mutalk = current_user.mutalks.build
            @pagy, @mutalks = pagy(Mutalk.all, items:10)
        end
    end
    
    
    def show
    end
    
    
    def new
        @mutalk = Mutalk.new
    end
    
    
    def create
        @mutalk = current_user.mutalks.build(mutalk_params)
        if @mutalk.save
            flash[:success] = "トーク が投稿されました"
            redirect_to @mutalk
        else
            @pagy, @mutalks = pagy(current_user.mutalks.order(id: :desc))
            flash.now[:danger] = "トーク が投稿されませんでした"
            render :new
        end
    end
    
    
    def edit
    end
    
    
    def update
        
        if @mutalk.update(mutalk_params)
            flash[:success] = "トーク は更新されました"
            redirect_to @mutalk
        else
            flash.now[:danger] = "トーク は更新されませんでした"
            render :edit
        end
    end    
    
    
    def destroy
        @mutalk.destroy
        
        flash[:success] = "トーク は削除されました"
        redirect_to mutalk_url
    end
    
    
    private
    
    
    #strong parameter
    def mutalk_params
        params.require(:mutalk).permit(:title, :content)
    end
    
    def correct_user
        @mutalk = current_user.mutalks.find_by(id: params[:id])
        unless @mutalk
            redirect_to root_url
        end
    end
    
end
