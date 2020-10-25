class BookingsController < ApplicationController
    before_action :authorized
    def index
        book_scedule = Book
            .select('books.id, scedules.scedule_time, users.fullname, users.email, doctors.name as doctor_name, hospitals.name as hospitals_name')
            .where(["books.user_id = ?",@user.id]) 
            .joins('join users on users.id = books.user_id')
            .joins('join scedules on scedules.id = books.scedule_id')
            .joins('join hospitals on hospitals.id = scedules.hospital_id')
            .joins('join doctors on doctors.id = scedules.doctor_id')
        render json:{status:'SUCCESS', message:'Loaded Booking Scedule User', data:book_scedule},status: :ok
    end

    def book_scedule
        scedule = Scedule.find(params[:user_id])
        difference = time_diff(scedule.scedule_time, Time.now)
        if difference.to_f <=  30 
            booking = Book.new(booking_params)
            if booking.save
                render json: {status: 'SUCCESS',message:'Booking Scedule Success', data:booking}, status: :ok
            else
                render json: {status: 'ERROR',message:'Booking Scedule Failed', data:booking.errors}, status: :unprocessable_entity
            end
        else
            render json: {status: 'ERROR',message:'Booking time larger than 30 minuts', data:scedule.scedule_time}, status: :unprocessable_entity
        end
    end

    private
    def time_diff(start_time, end_time)
        seconds_diff = (start_time - end_time).to_i.abs
      
        hours = seconds_diff / 3600
        seconds_diff -= hours * 3600
      
        minutes = seconds_diff / 60
        seconds_diff -= minutes * 60
      
        seconds = seconds_diff
      
        "#{minutes.to_s.rjust(2, '0')}"
        # or, as hagello suggested in the comments:
        # '%02d:%02d:%02d' % [hours, minutes, seconds]
      end

      def booking_params
        params.permit(:user_id, :scedule_id)
    end
end
