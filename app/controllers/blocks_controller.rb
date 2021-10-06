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
                redirect to "/#{@block.user_id}/blocks/#{@block.id}"
            else
                redirect to "/#{@user.id}/blocks/new"
                # flash that fields are required
            end
        else
            redirect to "/login"
        end
    end

    patch '/:id/blocks/:block_id' do
        if authenticated?
            @block = Block.find_by_id(params[:block_id])
            @block.update(params[:block])
            redirect to "/#{@block.user_id}/blocks/#{@block.id}"
        else
            redirect to "/login"
        end
    end

    delete '/:id/blocks/:block_id/delete' do
        if authenticated?
            @block = Block.find_by_id(params[:block_id])
            @block.delete
            redirect to "/#{@block.user_id}/blocks"
            # flash to acknowledge delete
        else
            redirect to "/login"
        end       
    end
    

end