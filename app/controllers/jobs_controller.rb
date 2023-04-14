class JobsController < ApplicationController
  before_action :set_job, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /jobs or /jobs.json
  def index
    @q = Job.ransack(params[:q])
    @jobs = @q.result(distinct: true);
    # @jobs = Job.all 
  end

  # GET /jobs/1 or /jobs/1.json
  def show
    # @job_app = @job.jobApplicants.build
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs or /jobs.json
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to job_url(@job), notice: "Job was successfully created." }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1 or /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to job_url(@job), notice: "Job was successfully updated." }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1 or /jobs/1.json
  def destroy
    @job.destroy

    respond_to do |format|
      format.html { redirect_to jobs_url, notice: "Job was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def apply_jobs
    @applied = JobApplicant.new(apply_jobs_params)
    if @applied.save
      redirect_to request.referer
    else
    render 'show'
    end
  end

  private

    def apply_jobs_params
      params.permit(:user_id, :job_id)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_params
      params.require(:job).permit(:name, :description, :posts)
    end

  end
