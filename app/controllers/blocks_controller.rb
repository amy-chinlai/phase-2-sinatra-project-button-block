class BlocksController < ApplicationController

    get '/:id/blocks' do
        @blocks = Block.all.find_all {|b| b.user_id == params[:id].to_i}
        erb :'blocks/index'
    end

    get '/:id/blocks/new' do
        erb :'blocks/new'
    end

    get '/:id/blocks/:block_id' do
        @block = Block.find_by_id(params[:block_id])
        erb :'blocks/show'
    end

    get '/:id/:blocks/:block_id/edit' do
        @block = Block.find_by_id(params[:block_id])
        erb :'blocks/edit'
    end

    post '/blocks' do
        @block = Block.new(params[:block])
        @block.user = User.find_by_id(session[:user_id])
        @block.save
        redirect to "/#{@block.user_id}/blocks/#{@block.id}"
    end

    patch '/:id/blocks/:block_id' do
        @block = Block.find_by_id(params[:block_id])
        @block.update(params[:block])
        redirect to "/#{@block.user_id}/blocks/#{@block.id}"
    end
    

end