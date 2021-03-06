class QuizzesController < ApplicationController
  before_action :set_quiz, only: %i[ edit update destroy ]

  # GET /quizzes or /quizzes.json
  def index
    @quizzes = Quiz.all.where(lesson_id: current_lesson.id)
  end
	def restart
		UserLessonQuiz.where(lesson_id: current_lesson.id).delete_all
		ul = UserLesson.find_by(lesson_id: current_lesson.id)
		ul.status = "started"
		ul.save
		us = UserSubject.find_by(subject_id: current_subject.id)
		us.status = "started"
		us.save
		session[:quiz_index] = 0
		redirect_to lesson_path(id: current_lesson.id)
	end
  # GET /quizzes/1 or /quizzes/1.json
  def show
		if next_quiz == 0
    	redirect_to quizzes_path
			session[:quiz_index] = 0
			user_lesson = UserLesson.find_by(lesson_id: current_lesson.id)
			user_lesson.status = "completed"
			user_lesson.save
		else
			@quiz = Quiz.find(next_quiz)
			if @quiz == nil
				session[:quiz_index] = 0 
			else
				if UserLessonQuiz.check_presence(@quiz.id).empty?
					UserLessonQuiz.create(user_id: current_user.id, lesson_id: current_lesson.id, quiz_id: @quiz.id)
				end
			end
		end
  end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
	@quiz.lesson = Lesson.find(current_lesson.id)
  end

  # GET /quizzes/1/edit
  def edit
  end

  # POST /quizzes or /quizzes.json
  def create
    @quiz = Quiz.new(quiz_params)

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to @quiz, notice: "Quiz was successfully created." }
        format.json { render :show, status: :created, location: @quiz }
		my_array = []
		my_array << @quiz.option1
		my_array << @quiz.option2
		my_array << @quiz.option3
		my_array << @quiz.option4
		
		correct_respo = my_array[@quiz.correct_response.to_i - 1]
		@quiz.correct_response_text = correct_respo
		@quiz.save
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzes/1 or /quizzes/1.json
  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to @quiz, notice: "Quiz was successfully updated." }
        format.json { render :show, status: :ok, location: @quiz }
		my_array = []
        my_array << @quiz.option1
        my_array << @quiz.option2
        my_array << @quiz.option3
        my_array << @quiz.option4

        correct_respo = my_array[@quiz.correct_response.to_i - 1]
        @quiz.correct_response_text = correct_respo
        @quiz.save
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1 or /quizzes/1.json
  def destroy
    @quiz.destroy
    respond_to do |format|
      format.html { redirect_to lesson_url(current_lesson), notice: "Quiz was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quiz_params
      params.require(:quiz).permit(:question, :option1, :option2, :option3, :option4, :correct_response, :lesson_id)
    end
end
