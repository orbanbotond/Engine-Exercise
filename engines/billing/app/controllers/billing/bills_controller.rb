require_dependency "billing/application_controller"

module Billing
  class BillsController < ApplicationController
    before_action :set_bill, only: [:show, :edit, :update, :destroy]

    # GET /bills
    def index
      @bills = Bill.all
    end

    # GET /bills/1
    def show
    end

    # GET /bills/new
    def new
      @bill = Bill.new
    end

    # GET /bills/1/edit
    def edit
    end

    # POST /bills
    def create
      @bill = Bill.new(bill_params)

      if @bill.save
        redirect_to @bill, notice: 'Bill was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /bills/1
    def update
      if @bill.update(bill_params)
        redirect_to @bill, notice: 'Bill was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /bills/1
    def destroy
      @bill.destroy
      redirect_to bills_url, notice: 'Bill was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_bill
        @bill = Bill.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def bill_params
        params.require(:bill).permit(:description)
      end
  end
end
