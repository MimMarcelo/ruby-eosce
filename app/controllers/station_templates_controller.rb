class StationTemplatesController < ApplicationController
  before_action :set_station_template, only: %i[ show edit update destroy ]

  # GET /station_templates ou /station_templates.json
  def index

    # Retorna apenas as estações criadas pelo usuário logado
    @station_templates =
      current_user.station_templates.order('updated_at desc').all
  end # def index

  # GET /station_templates/1 ou /station_templates/1.json
  def show

  end # def show

  # GET /station_templates/new
  def new
    
    # Caso a requisição de nova estação tenha vindo da página de Schedules
    # Armazenar o ID do Schedule permite:
    # 1. Retornar à página de edição do Schedule
    # 2. Efetuar o vínculo entre Station e Schedule
    if params[:schedule_id] then
      @schedule_id = params[:schedule_id]
    end

    @station_template = StationTemplate.new

    # @station_template.save
    # @questions = @station_template.questions # Question.all
  end # def new

  # GET /station_templates/1/edit
  def edit

    @questions = @station_template.questions
  end # def edit

  # POST /station_templates ou /station_templates.json
  def create

    # Cria o objeto da estação a partir dos parâmetros do formulário
    @station_template = StationTemplate.new(station_template_params)
    
    respond_to do |format|

      # Em caso de ERROS para salvar a Station para gerar seu ID
      if !@station_template.save
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @station_template.errors, status: :unprocessable_entity }
        return
      end

      # Em caso de ERROS para realizar a associação entre a Station criada
      # e o usuário logado (dono da Station)
      if !user_association(@station_template.id, current_user.id, true)
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @station_template.errors, status: :unprocessable_entity }
        return
      end

      # Se o schedule_id estiver informado,
      # redirecionar para a tela de edição do Schedule
      if params[:schedule_id]
        format.html { redirect_to add_station_path(params[:schedule_id], @station_template.id), notice: t("station_template_created") }
        return
      end
      
      format.html { redirect_to station_templates_url, notice: t("station_template_created") }
      format.json { render :show, status: :created, location: @station_template }
    end # respond_to
  end # def create

  # PATCH/PUT /station_templates/1 ou /station_templates/1.json
  def update

    respond_to do |format|

      # Em caso de ERROS para atualizar a Station
      if !@station_template.update(station_template_params)
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @station_template.errors, status: :unprocessable_entity }
        return
      end

      format.html { redirect_to station_templates_url, notice: t("station_template_updated") }
      format.json { render :show, status: :ok, location: @station_template }
    end
  end # def update

  # DELETE /station_templates/1 ou /station_templates/1.json
  def destroy
    @user_station_template = current_user.station_templates.delete(
      @station_template)
    #@user_station_template.destroy
    @station_template.destroy

    respond_to do |format|
      format.html { redirect_to station_templates_url, notice: t("station_template_destroyed") }
      format.json { head :no_content }
    end
  end # def destroy

  private

    # Usa callbacks para compartilhar setup ou associações entre ações
    def set_station_template

      @station_template = StationTemplate.find(params[:id])
    end

    # Só permite uma lista limitada de parâmetros confiáveis
    def station_template_params

      params.require(:station_template).permit(:name, :resume, :procedure, :evaluation, :score, :minutes, :level)
    end

    # Realiza o vínculo entre estação criada e o usuário (dono ou colaborador)
    def user_association(station_id, user_id, owner = false)

      @user_station_template = UserStationTemplate.new
      @user_station_template.user_id = user_id
      @user_station_template.station_template_id = station_id
      @user_station_template.owner = owner
      return @user_station_template.save
    end
end
