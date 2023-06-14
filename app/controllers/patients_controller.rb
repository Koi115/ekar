class PatientsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    if params[:ward_num] == nil
      @patients = Patient.joins(:admissions).where(admissions: { ward_id: current_user.ward_id }).order("roombed_id ASC")
      @ward_num = current_user.ward_id
    else
      @patients = Patient.joins(:admissions).where(admissions: { ward_id: params[:ward_num] }).order("roombed_id ASC")
      @ward_num = params[:ward_num]
    end
    @patient_count = @patients.count
    @male_patient_count = @patients.where(gender_id: '2').count
    @female_patient_count = @patients.where(gender_id: '3').count
    @lgbt_patient_count = @patients.where(gender_id: '4').count
    @doppo_patient_count = @patients.where(transfer_id: '2').count
    @goso_patient_count = @patients.where(transfer_id: '3').count
    @tanso_patient_count = @patients.where(transfer_id: '4').count
  end



  
  def show
    @patient = Patient.find(params[:id])
    @ward_num = @patient.admissions.first&.ward_id
    @admission = @patient.admissions.first
    @address = @patient.addresses.first
  end



  def new
    # @patient = Patient.new
    @pat_add_cont_adm = PatAddContAdm.new

  end


  def create
    @pat_add_cont_adm = PatAddContAdm.new(pat_add_cont_adm_params)
    date = params.require(:pat_add_cont_adm).permit(:date_of_birth)

    if date["date_of_birth(1i)"] != "" && date["date_of_birth(2i)"] != "" && date["date_of_birth(3i)"] != "" 
      date_of_birth = Date.parse( date["date_of_birth(1i)"] + "-" + date["date_of_birth(2i)"] + "-" + date["date_of_birth(3i)"] )
      @pat_add_cont_adm = PatAddContAdm.new(pat_add_cont_adm_params.merge(date_of_birth: date_of_birth))

      if @pat_add_cont_adm.valid?
        @pat_add_cont_adm.save
        redirect_to root_path
      else
        render :new
      end
    else
      # 生年月日に問題がある場合は、登録画面へ戻す
      # エラーコードは修正必要
      render :new
    end
  end


  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      redirect_to "/patients/#{@patient.id}"
    else
      render :edit
    end

  end



  private

  # :date_of_birth属性は後でmergeする
# , :ward_num パラムスにいる？
  def pat_add_cont_adm_params
    params.require(:pat_add_cont_adm).permit(:fa_patient_id, :full_name, :full_name_kana, :gender_id, :blood_abo_id, :blood_rh_id, :transfer_id, :pmhx, :description, :image, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :phone_number2, :full_name1, :full_name_kana1, :relation1, :phone_number11, :phone_number12, :description1, :full_name2, :full_name_kana2, :relation2, :phone_number21, :phone_number22, :description2, :ward_id, :roombed_id, :admission_date, :hxofadm)
  end



def patient_params
  params.require(:patient).permit(:fa_patient_id, :full_name, :full_name_kana, :gender_id, :blood_abo_id, :blood_rh_id, :transfer_id, :pmhx, :description, :image)
end



end
