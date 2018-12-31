class ViewFormDetailsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @applicant_detail = ApplicantDetail.all
    end
    
    def destroy
        @datum = ApplicantDetail.find(params[:id])
        @service = ApplicantDetail.find(@datum.service_id)
        status = @datum.destroy
        @service.destroy
        render :json => { status: status}
      end
end