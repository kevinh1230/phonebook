class CustomersController < ApplicationController

	http_basic_authenticate_with name: "kevin", password: "kevin"

	def index
		if @customer = Customer.find_by_phonenumber(params[:phonenumber])
			redirect_to @customer
    else
      printf("Not Working")
		end
	end

	def show
		@customer = Customer.find(params[:id])
	end

	def new
		@customer = Customer.new
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def create
		@customer = Customer.new(customer_params)

		if @customer.save
			redirect_to @customer
		else
			render 'new'
		end
	end

	def update
	  @customer = Customer.find(params[:id])
	 
	  if @customer.update(customer_params)
	    redirect_to @customer
	  else
	    render 'edit'
	  end
	end

	def destroy
		@customer = Customer.find(params[:id])
		@customer.destroy

		redirect_to customers_path
	end

	private
	  def customer_params
	  	params.require(:customer).permit(:phonenumber, :address)
	  end
end
