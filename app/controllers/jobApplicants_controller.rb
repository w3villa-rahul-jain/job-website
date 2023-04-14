class JobApplicants < ApplicationController

    # def create
    #     @user = current_user.id
    #     @job = Job.find_by(params[:id]);
    #     JobApplicant.create()
    # end

    def destroy 
        @remove_applied_job = current_user.jobApplicants.find(params[:id])
        @remove_applied_job.destroy
    end
end