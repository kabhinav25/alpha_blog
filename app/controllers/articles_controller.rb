class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit,:update,:destroy,:show]
  before_action :require_user, except: [:index,:show]
  before_action :require_same_user, only: [:edit,:update,:destroy]
  def require_same_user
if current_user!=@article.user && !current_user.admin?
  flash[:danger]="you can only edit & delete your own articles"
  redirect_to root_path
end
  end
  def index
    @articles=Article.paginate(page: params[:page],per_page:2)
  end
  def new
@article=Article.new
  end
  def edit
  end
def update
  if @article.update(article_params)
    @article.user=User.first
    flash[:success] = "article updated"
    redirect_to article_path(@article)
  else
    render 'new'
  end
end
def destroy
  @article.destroy
  flash[:danger] = "article deleted"
  redirect_to articles_path
end
  def create
    @article=Article.new(article_params)
    @article.user=current_user
   if @article.save
     flash[:success] = "article saved"
    redirect_to article_path(@article)
   else
     render 'new'
  end

  end
  def show
  end
  private
  def set_article
    @article=Article.find(params[:id])
  end
  def article_params
    params.require(:article).permit(:title,:description)
  end
end