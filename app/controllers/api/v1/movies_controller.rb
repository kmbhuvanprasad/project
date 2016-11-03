module Api
	module V1
		class MoviesController < ApplicationController
			
			def create
				@movie=Movie.new(movie_params)
				if @movie.save
				   render json:{message:'Successfully created',data:@movie,status_code:201}
				else
					 render json:{message:'failure',data:@movie.errors,status_code:422}
				end
			end

			def edit
			 	@movie=Movie.find_by_id(params[:id])
			 	render json:{message:'Successfully edited',data:@movie,status_code:201}
			end

			def show
				@movie=Movie.find_by_title(params[:title])
				render json:{message:'Successfully showed required entry',data:@movie,status_code:201}
			end

			def update
			 	@movie=Movie.find_by_title(params[:title])
			 	@movie.update(movie_params)
			 	render json:{message:'Successfully updated',data:@movie,status_code:201}
			end

			def destroy
			 	@movie=Movie.find_by_id(params[:id])
			 	@movie.destroy
			 	render json:{message:'Successfully deleted',data:@movie,status_code:201}
			end


			private
			 def movie_params
			 	params.require(:movie).permit(:title,:year,:rating,:actors,:director,:producer,:language)
			 end

		end
	end
end