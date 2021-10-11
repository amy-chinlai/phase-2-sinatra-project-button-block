class BlocksController < ApplicationController

    get '/:id/blocks' do
        if authenticated?
            @blocks = Block.all.find_all {|b| b.user_id == params[:id].to_i}
            erb :'blocks/index'
        else
            redirect to "/login"
            flash[:message] = "You do not have access to that page."
        end
    end

    get '/:id/blocks/new' do
        if authenticated?
            erb :'blocks/new'
        else
            flash[:message] = "You do not have access to that page."
            redirect to "/login"
        end
    end

    get '/:id/blocks/:block_id' do
        if authenticated?
            @block = Block.find_by_id(params[:block_id])
            erb :'blocks/show'
        else
            flash[:message] = "You do not have access to that page."
            redirect to "/login"
        end
    end

    get '/:id/:blocks/:block_id/edit' do
        if authenticated?
            @block = Block.find_by_id(params[:block_id])
            erb :'blocks/edit'
        else
            flash[:message] = "You do not have access to that page."
            redirect to "/login"
        end
    end

    post '/:id/blocks' do
        if authenticated?
            @block = Block.new(params[:block])
            if @block.valid?
                @block.user = User.find_by_id(session[:user_id])
                @block.save
                flash[:message] = "Successfully created block."
                redirect to "/#{@block.user_id}/blocks/#{@block.id}"
            else
                flash[:message] = "Please fill out all fields."
                redirect to "/#{@user.id}/blocks/new"
            end
        else
            flash[:message] = "You do not have access to that action."
            redirect to "/login"
        end
    end

    patch '/:id/blocks/:block_id' do
        if authenticated?
            @block = Block.find_by_id(params[:block_id])
            @block.update(params[:block])
            flash[:message] = "Successfully edited block."
            redirect to "/#{@block.user_id}/blocks/#{@block.id}"
        else
            flash[:message] = "You do not have access to that action."
            redirect to "/login"
        end
    end

    delete '/:id/blocks/:block_id/delete' do
        if authenticated?
            @block = Block.find_by_id(params[:block_id])
            @block.delete
            flash[:message] = "Successfully deleted block."
            redirect to "/#{@block.user_id}/blocks"
        else
            flash[:message] = "You do not have access to that action."
            redirect to "/login"
        end       
    end
    

end