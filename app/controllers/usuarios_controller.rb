class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    @usuario = Usuario.find(params[:id])
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
    @usuario = Usuario.find(params[:id])
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to @usuario, notice: 'Usuario was successfully created.' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'Usuario was successfully updated.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def getCPF
    return @usuario.cpf
  end

  def setCPF(novocpf)
    @usuario.cpf = novocpf
  end

  def getNome
    return @usuario.nome
  end

  def setNome(novonome)
    @usuario.nome = novonome
  end

  def getSenha
    return @usuario.senha
  end

  def setSenha(novasenha)
    @usuario.senha = novasenha
  end

  def getEmail
    return @usuario.email
  end

  def setEmail(novoemail)
    @usuario.email = novoemail
  end

  def getTelefone
    return @usuario.telefone
  end

  def setTelefone(novotelefone)
    @usuario.telefone = novotelefone
  end

  def getCapacidadeDeGerencia
    return @usuario.capacidadeDeGerencia
  end

  def setCapacidadeDeGerencia(novagerencia)
    @usuario.capacidadeDeGerencia = novagerencia
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:cpf, :nome, :senha, :email, :telefone, :capacidadeDeGerencia)
    end
end