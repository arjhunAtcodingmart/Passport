class PassportFormController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create
        @passport = params["passport_form"]

        @service_data=@passport['service_data']
        @service = Service.new(:select_type => @service_data["select_type"],:type_of_application => @service_data["type_of_application"],:type_of_passport => @service_data["type_of_passport"],:validity => @service_data["validity"])
        
        if @service.save
            @applicant_data=@passport['applicant_data']
            @applicant_detail = ApplicantDetail.new(:first_name => @applicant_data['first_name'],:surname => @applicant_data['surname'], :other_names => @applicant_data['other_names'], :name_changed => @applicant_data['name_changed'], :dob => @applicant_data['dob'], :city => @applicant_data['city'],:select_country => @applicant_data['select_country'], :select_state => @applicant_data['select_state'], :select_district => @applicant_data['select_district'], :select_gender => @applicant_data['select_gender'], :select_marital => @applicant_data['select_marital'], :select_citizenship => @applicant_data['select_citizenship'], :select_employment => @applicant_data['select_employment'], :select_gov_servant => @applicant_data['select_gov_servant'], :select_qualification => @applicant_data['select_qualification'], :select_non_e_c_r => @applicant_data['select_non_e_c_r'],:pan_id => @applicant_data["pan_id"],:voter_id => @applicant_data['voter_id'],:aadhaar_number => @applicant_data['aadhaar_number'], :service_id => @service.id)
            
            if @applicant_detail.save
                @applicant_id = @applicant_detail.id
                @family_data=@passport['family_data']
                
                @family_detail = FamilyDetail.new(:father_name => @family_data['father_name'],:father_surname => @family_data['father_surname'], :guardian_name => @family_data['guardian_name'], :guardian_surname => @family_data['guardian_surname'], :mother_name => @family_data['mother_name'], :mother_surname => @family_data['mother_surname'],:applicant_id => @applicant_id)
                if @family_detail.save
                     @address_data=@passport['address_data']

                    @address_detail = AddressDetail.new(:address_same => @address_data['address_same'],:address_in_out => @address_data['address_in_out'], :address => @address_data['address'], :mobile_number => @address_data['mobile_number'],:telephone_number => @address_data['telephone_number'], :email => @address_data['email'], :first_refer_address => @address_data['first_refer_address'], :first_refer_mobile_number => @address_data['first_refer_mobile_number'], :first_refer_telephone_number => @address_data['first_refer_telephone_number'], :second_refer_address => @address_data['second_refer_address'], :second_refer_mobile_number => @address_data['second_refer_mobile_number'], :second_refer_telephone_number => @address_data['second_refer_telephone_number'], :applicant_id => @applicant_id)
                    if @address_detail.save
                        @other_data=@passport['other_data']

                        @other_detail = OtherDetail.create(:passport_num => @other_data['passport_num'], :doi => @other_data['doi'], :doe => @other_data['doe'], :poi => @other_data['poi'], :passport_issue => @other_data['passport_issue'], :applicant_id => @other_data['applicant_id'], :charged => @other_data['charged'], :offence => @other_data['offence'], :denied => @other_data['denied'], :revoked => @other_data['revoked'], :political_asylum => @other_data['political_asylum'], :ec => @other_data['ec'],:place => @other_data['place'], :date => @other_data['date'], :applicant_id => @applicant_id)
                        render :json => { status: @other_detail}
                    end
                end
            end
        end
    end

    def edit
        @applicant_detail = ApplicantDetail.find(params[:id])
        @service = Service.find(@applicant_detail.service_id)
        @family_detail = @applicant_detail.family_details
        @address_detail = @applicant_detail.address_details
        @other_detail = @applicant_detail.other_details
    end

    def update
        @applicant_detail = ApplicantDetail.find(params[:id])
        @applicant_val = @applicant_detail.update_attributes(applicant_params)

        @service_id = @applicant_detail.service_id
        @service = Service.find(@service_id)
        @service_detail = @service.update(service_params) 

        @family_detail = @applicant_detail.family_details
        @family_val = @family_detail.update(family_params)
        
        @address_detail = @applicant_detail.address_details
        @address_val = @address_detail.update(address_params)

        @other_detail = @applicant_detail.other_details
        @other_val = @other_detail.update(other_params)

        render :json=>{ status: @other_val}
    end
    private
        def applicant_params
        temp_params = params[:passport_form]
            temp_params.require(:applicant_data).permit(:first_name,:surname,:other_names,:name_changed,:dob,:city,:select_country,:select_state,:select_district,:select_gender,:select_marital,:select_citizenship,:select_employment,:select_gov_servant,:select_qualification,:select_non_e_c_r,:pan_id,:voter_id,:aadhaar_number)
        end

        def service_params
            temp_params = params[:passport_form]
            temp_params.require(:service_data).permit(:select_type,:type_of_application,:type_of_passport,:validity)
        end

        def family_params
        temp_params = params[:passport_form]
            temp_params.require(:family_data).permit(:father_name,:father_surname, :mother_name,:mother_surname,:guardian_name,:guardian_surname)
        end


        def address_params
        temp_params = params[:passport_form]
            temp_params.require(:address_data).permit(:address_same,:address_in_out,:address,:mobile_number,:telephone_number,:email,:first_refer_address,:first_refer_mobile_number,:first_refer_telephone_number,:second_refer_address,:second_refer_mobile_number,:second_refer_telephone_number)
        end

        def other_params
            temp_params = params[:passport_form]
                temp_params.require(:other_data).permit(:passport_num,:doi,:doe,:poi,:passport_issue,:applicant_id,:charged,:offence,:denied,:revoked,:political_asylum,:ec,:place,:date)
        end
end
