class AssetsController < ApplicationController
	# GET /assets
	# GET /assets.json
	def index
		@assets = Asset.all

		respond_to do |format|
			format.html #index.html.erb
			format.json { render json: @assets }
		end
	end

	# GET /assets/1
	# GET /assets/1.json
	def show
		@asset = Asset.find(params[:id])

		respond_to do |format|
			format.html #index.html.erb
			format.json { render json: @asset }
		end
	end

	# GET /assets/new
	# GET /assets/new.json
	def new
		@asset = Asset.new

		respond_to do |format|
			format.html #index.html.erb
			format.json { render json: @asset }
		end
	end

	# GET /assets/1/edit
	def edit
		@asset = Asset.find(params[:id])
	end

	# POST /assets
	# POST /assets.json
	def create
		@asset = Asset.new(params[:asset])

		respond_to do |format|
			if @asset.save
				format.html { redirect_to @asset, notice: 'Boom, asset created.' }
				format.json { render json: @asset, status: :created, location: @asset }
			else
				format.html { render action: "Create new asset" }
				format.json { render json: @asset.errors, status: :unprpcessable_entity }
			end
		end
	end

	# PUT /assets/1
	# PUT /assets/1.json
	def update
		@asset = Asset.find(params[:id])

		respond_to do |format|
			if @asset.update_attributes(params[:page])
				format.html { redirect_to @asset, notice: 'Boom, asset updated.' }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @post.errors, status: :unprpcessable_entity }
			end
		end
	end

	# DELETE /assets/1
	# DELETE /assets/1.json
	def destroy
		@asset = Asset.find(params[:id])
		@asset.destroy

		respond_to do |format|
			format.html { redirect_to pages_url }
			format.json { head :no_content }
		end
	end
end