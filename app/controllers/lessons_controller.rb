class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[ show edit update destroy ]

  # GET /lessons or /lessons.json
  def index
    @lessons = Lesson.all.where(subject_id: current_subject.id)
  end

  # GET /lessons/1 or /lessons/1.json
  def show
	
  end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
	@lesson.subject = Subject.find(current_subject )
  end

  # GET /lessons/1/edit
  def edit
  end

  # POST /lessons or /lessons.json
  def create
    @lesson = Lesson.new(lesson_params)

    respond_to do |format|
      if @lesson.save
	Activity.create(name: "Created lesson", description: "You just created the lesson : " + @lesson.name )
        format.html { redirect_to static_welcome_url , notice: "Lesson was successfully created." }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1 or /lessons/1.json
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to @lesson, notice: "Lesson was successfully updated." }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1 or /lessons/1.json
  def destroy
	name= @lesson.name
    @lesson.destroy
    respond_to do |format|
	Activity.create(name: "Deleted lesson", description: "You just deleted  the lesson : " + name )
      format.html { redirect_to static_welcome_url, notice: "Lesson was successfully destroyed." }
      format.json { head :no_content }
    end
  end

	def delete_image
		image = ActiveStorage::Attachment.find(params[:image_id])
		if current_user == image.record
			image.purge
			redirect_back(fallback_location: request.referer)
		else
			redirect_to root_url, notice: "Only the administrator of this site can delete pictures"
		end
	end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lesson_params 
      params.require(:lesson).permit(:name, :subject_id , :lesson_notes, :lesson_video, lesson_pictures: [])
    end
end

