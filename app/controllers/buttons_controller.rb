class ButtonsController < ApplicationController

    get '/:id/blocks/:block_id/buttons' do
        @block = Block.find_by_id(params[:block_id])
        erb :'buttons/index'
    end

    get '/:id/blocks/:block_id/buttons/new' do
        @block = Block.find_by_id(params[:block_id])
        erb :'buttons/new'
    end

    get '/:id/blocks/:block_id/buttons/:button_id/edit' do
        @button = Button.find_by_id(params[:button_id])
        erb :'buttons/edit'
    end

    post '/:id/blocks/:block_id/buttons' do
        @button = Button.new(params[:button])
        @button.block = Block.find_by_id(params[:block_id])
        @button.save
        redirect to "/#{@button.block.user_id}/blocks/#{@button.block.id}"
    end

    patch '/:id/blocks/:block_id/buttons/:button_id' do
        @button = Button.find_by_id(params[:button_id])
        @button.update(params[:button])
        redirect to "/#{@button.block.user_id}/blocks/#{@button.block.id}"
    end    

    delete '/:id/blocks/:block_id/buttons/:button_id/delete' do
        @button = Button.find_by_id(params[:button_id])
        @button.delete
        redirect to "/#{@button.block.user_id}/blocks/#{@button.block.id}"
        # flash to acknowledge delete
    end


end