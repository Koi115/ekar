class PatientsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @patients = Patient.all

        # rooms roombed table ward 作ってから
        # @ward_id = params[]
        # @patients = Patient.where(ward.id: @current_user.ward_id)
        # if @params[ward_id] != nil
        #   @patients = Patient.where(ward.id: @params[ward_id])
        # end


    # if params[:ward_num] == nil
    #   @patients = Patient.joins(:admissions).where(admissions: { ward_id: current_user.ward_id })
    # else
    #   @patients = Patient.joins(:admissions).where(admissions: { ward_id: params[:ward_num] })
    # end


    @patient_count = @patients.count
    @male_patient_count = @patients.where(gender_id: '2').count
    @female_patient_count = @patients.where(gender_id: '3').count
    @lgbt_patient_count = @patients.where(gender_id: '4').count
    @doppo_patient_count = @patients.where(transfer_id: '2').count
    @goso_patient_count = @patients.where(transfer_id: '3').count
    @tanso_patient_count = @patients.where(transfer_id: '4').count
    
  end

  def new
    @patient = Patient.new
  end


  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to root_path
    else
      render :new
    end
  end




  private

  # def patient_params
  #   params.require(:patient).permit(:name, :image, :description, :category_id, :status_id, :fee_id, :prefecture_id, :period_id, :price).merge(user_id: current_user.id)
  # end

  def patient_params
    params.require(:patient).permit(:fa_patient_id, :full_name, :full_name_kana, :gender_id, :blood_abo_id, :blood_rh_id, :date_of_birth, :transfer_id, :description, :image, :ward_num)
  end









end
