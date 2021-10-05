class BlocksController < ApplicationController

    get '/:id/blocks' do
        @blocks = Block.all.find_all {|b| b.user_id == params[:id].to_i}
        erb :'blocks/index'
    end

    get '/:id/blocks/:block_id' do
        @block = Block.find_by_id(params[:block_id])
        erb :'blocks/show'
    end

end