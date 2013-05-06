class AssetsController < ApplicationController
	before_filter :authenticate_user!, :except => [:download]

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
				format.html { redirect_to @asset.page, notice: 'Boom, asset created.' }
				# format.json { render json: @asset, status: :created, location: @asset }
				# @template = render(:partial => 'assets/form', :locals => { :asset => @asset })
				# format.json { render json: @template, status: :created, location: @asset }
				format.json { render :json => { :template => render_to_string(:partial => 'assets/form', :formats => [:html], :locals => { :asset => @asset }) } }


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
			if @asset.update_attributes(params[:asset])
				format.html { redirect_to @asset.page, notice: 'Boom, asset updated.' }
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
			format.html { redirect_to @asset.page }
			format.json { head :no_content }
		end
	end

	# GET /assets/1/download
	def download
		@asset = Asset.find(params[:asset_id])

		if !ENV['S3_KEY'] || !ENV['S3_SECRET'] || !ENV['S3_BUCKET_NAME']
			send_file File.join(Rails.root, 'public', @asset.asset_url), :filename => File.basename(@asset.asset_url).to_s
		else
			open('https://s3.amazonaws.com/' + ENV['S3_BUCKET_NAME'] + '/uploads/asset/asset/' + @asset.id.to_s + '/' + File.basename(@asset.asset_url).to_s) {|file|
				tmpfile = Tempfile.new(File.basename(@asset.asset_url).to_s)
				File.open(tmpfile.path, 'wb') do |f|
					f.write file.read
				end
				send_file tmpfile.path, :filename => File.basename(@asset.asset_url).to_s
			}
		end
	end
end
