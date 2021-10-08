class ButtonsController < ApplicationController

    get '/:id/blocks/:block_id/buttons' do
        if authenticated? 
            @block = Block.find_by_id(params[:block_id])
            erb :'buttons/index'
        else
            redirect to "/login"
        end
    end

    get '/:id/blocks/:block_id/buttons/new' do
        if authenticated? 
            @block = Block.find_by_id(params[:block_id])
            erb :'buttons/new'
        else
            redirect to "/login"
        end
    end

    get '/:id/blocks/:block_id/buttons/:button_id/edit' do
        if authenticated? 
            @button = Button.find_by_id(params[:button_id])
            erb :'buttons/edit'
        else
            redirect to "/login"
        end
    end

    post '/:id/blocks/:block_id/buttons' do
        if authenticated? 
            @button = Button.new(params[:button])
            @button.block = Block.find_by_id(params[:block_id])
            @button.save
            flash[:message] = "Successfully created button."
            redirect to "/#{@button.block.user_id}/blocks/#{@button.block.id}"
        else
            redirect to "/login"
        end
    end

    patch '/:id/blocks/:block_id/buttons/:button_id' do
        if authenticated? 
            @button = Button.find_by_id(params[:button_id])
            @button.update(params[:button])
            flash[:message] = "Successfully edited button."
            redirect to "/#{@button.block.user_id}/blocks/#{@button.block.id}"
        else
            redirect to "/login"
        end
    end    

    delete '/:id/blocks/:block_id/buttons/:button_id/delete' do
        if authenticated? 
            @button = Button.find_by_id(params[:button_id])
            @button.delete
            flash[:message] = "Successfully deleted button."
            redirect to "/#{@button.block.user_id}/blocks/#{@button.block.id}"
        else
            redirect to "/login"
        end
    end


end