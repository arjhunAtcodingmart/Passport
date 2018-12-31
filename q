
[1mFrom:[0m /home/arjhun/Documents/Angular task new/passport/app/controllers/passport_form_controller.rb @ line 34 PassportFormController#edit:

    [1;34m25[0m: [32mdef[0m [1;34medit[0m
    [1;34m26[0m:     @applicant_detail = [1;34;4mApplicantDetail[0m.find(params[[33m:id[0m])
    [1;34m27[0m:     @service = [1;34;4mService[0m.find(@applicant_detail.service_id)
    [1;34m28[0m:     @family_detail = @applicant_detail.family_details
    [1;34m29[0m:     @address_detail = @applicant_detail.address_details
    [1;34m30[0m:     @other_detail = @applicant_detail.other_details
    [1;34m31[0m:     @all_data = @applicant_detail,@service,@family_detail,@address_detail,@other_detail
    [1;34m32[0m:     @all={}
    [1;34m33[0m:     @all_data.each [32mdo[0m |i|
 => [1;34m34[0m:         binding.pry
    [1;34m35[0m:         @all+=i
    [1;34m36[0m:     [32mend[0m
    [1;34m37[0m:     [1;34m# binding.pry[0m
    [1;34m38[0m: [32mend[0m

