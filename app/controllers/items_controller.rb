class ItemsController < ApplicationController
  before_action :set_items, only: %i[ index active completed ]
  before_action :set_item, only: %i[ edit update destroy toggle_completed ]

  def index
  end

  def active
  end

  def completed
  end

  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.turbo_stream
        format.html { redirect_to items_url, notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("new_todo", partial: "form", locals: { todo: @todo }) }
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def toggle_completed
    if @item.completed?
      @item.update(completed_at: nil)
    else
      @item.update(completed_at: DateTime.now)
    end

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to items_url, notice: "Item was updated" }
      format.json { head :no_content }
    end
  end

  def toggle_all
    if Item.count == Item.completed.count
      Item.all.each { |item| item.update(completed_at: nil) }
    else
      Item.all.each { |item| item.update(completed_at: DateTime.now) }
    end

    @items = Item.grouped

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to items_url, notice: "Items were updated" }
      format.json { head :no_content }
    end
  end

  def clear_completed
    Item.completed.destroy_all

    @items = Item.grouped

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to items_url, notice: "Completed items were successfully cleared." }
      format.json { head :no_content }
    end
  end

  private
    def set_items
      @items = Item.grouped
    end

    def set_item
      @item = Item.find(params.expect(:id))
    end

    def item_params
      params.expect(item: [ :body, :completed_at ])
    end
end
