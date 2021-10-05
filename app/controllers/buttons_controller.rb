class ButtonsController < ApplicationController

    get '/:id/blocks/:block_id/buttons' do
        @block = Block.find_by_id(params[:block_id])
        erb :'buttons/index'
    end

    get '/:id/blocks/:block_id/buttons/new' do
        @block = Block.find_by_id(params[:block_id])
        erb :'buttons/new'
    end

    post '/:id/blocks/:block_id/buttons' do
        @button = Button.new(params[:button])
        @button.block = Block.find_by_id(params[:block_id])
        @button.save
        redirect to "/#{@button.block.user_id}/blocks/#{@button.block.id}"
    end


end