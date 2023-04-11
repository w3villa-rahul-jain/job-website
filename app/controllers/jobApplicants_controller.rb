class JobApplicants < ApplicationController

    def create
        @user = current_user.id
        @job = Job.find_by(params[:id]);
        JobApplicant.create()
    end
end