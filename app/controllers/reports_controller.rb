class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy, :get_pdf]

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.where(user: current_user)
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new
    @report.options['enumerations'] = {}
    @report.options['enumerations'][SecureRandom.uuid] = { server: '', tcp: '', udp: ''}

    @report.options['penetrations'] = {}
    @report.options['penetrations'][SecureRandom.uuid] = {}


    vulnerability_ids = @report.options['penetrations'].keys
    @screenshots = Screenshot.where(vulnerability_id: vulnerability_ids)
  end

  # GET /reports/1/edit
  def edit
    vulnerability_ids = @report.options['penetrations'].keys
    @screenshots = Screenshot.where(vulnerability_id: vulnerability_ids)
  end

  def get_pdf
    report = ReportPdf.new
    report.set_options(@report.options)
    report.set_screenshots(Screenshot.where(report_id: @report.id))
    send_data report.generate!, type: "application.pdf", filename: @report.options['report_name'] + ".pdf"
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)
    @report.user = current_user

    respond_to do |format|
      if @report.save
        format.html { redirect_to reports_url, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to reports_url, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render reports_url }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
      if @report.user != current_user
        redirect_to reports_path, notice: 'You do not have access to that report.'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit!
    end
end
