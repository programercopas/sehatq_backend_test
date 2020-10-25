class ScedulesController < ApplicationController
    before_action :authorized

    def index
        scedules = Scedule.select('scedules.id, scedules.scedule_time, hospitals.name as hospital_name, doctors.name as doctor_name')
            .joins('join hospitals on hospitals.id = scedules.hospital_id')
            .joins('join doctors on doctors.id = scedules.doctor_id')
        render json:{status:'SUCCESS', message:'Loaded Doctor Scedule', data:scedules},status: :ok
    end
end
