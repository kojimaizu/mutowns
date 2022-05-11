class MutalksController < ApplicationController
    
    def index
        if logged_in?
            @mutalks = Mutalk.all
            @pagy, @mutalks = pagy(Mutalk.all, items:10)
        end
    end
    
    
    def show
        @mutalk = Mutalk.find(params[ :id])
    end
    
    
    def new
        @mutalk = Mutalk.new
    end
    
    
    def create
        @mutalk = Mutalk.new(mutalk_params)
        
        
        if @mutalk.save
            flash[:success] = "トーク が投稿されました"
            redirect_to @mutalk
        else
            flash.now[:danger] = "トーク が投稿されませんでした"
            render :new
        end
    end
    
    
    def edit
        @mutalk = Mutalk.find(params[:id])
    end
    
    
    def update
        @mutalk = Mutalk.find(params[:id])
        
        if @mutalk.update(mutalk_params)
            flash[:success] = "トーク は更新されました"
            redirect_to @mutalk
        else
            flash.now[:danger] = "トーク は更新されませんでした"
            render :edit
        end
    end    
    
    
    def destroy
        @mutalk = Mutalk.find(params[:id])
        @mutalk.destroy
        
        flash[:success] = "トーク は削除されました"
        redirect_to mutalk_url
    end
    
    
    private
    
    
    #strong parameter
    def mutalk_params
        params.require(:mutalk).permit(:title, :content)
    end
    
end
