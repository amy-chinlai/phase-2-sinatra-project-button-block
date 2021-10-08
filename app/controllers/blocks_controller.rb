class BlocksController < ApplicationController

    get '/:id/blocks' do
        if authenticated?
            @blocks = Block.all.find_all {|b| b.user_id == params[:id].to_i}
            erb :'blocks/index'
        else
            redirect to "/login"
            # flash you do not have access to this page
        end
    end

    get '/:id/blocks/new' do
        if authenticated?
            erb :'blocks/new'
        else
            redirect to "/login"
        end
    end

    get '/:id/blocks/:block_id' do
        if authenticated?
            @block = Block.find_by_id(params[:block_id])
            erb :'blocks/show'
        else
            redirect to "/login"
        end
    end

    get '/:id/:blocks/:block_id/edit' do
        if authenticated?
            @block = Block.find_by_id(params[:block_id])
            erb :'blocks/edit'
        else
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
            redirect to "/login"
        end       
    end
    

end