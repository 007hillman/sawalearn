require "application_system_test_case"

class QuizzesTest < ApplicationSystemTestCase
  setup do
    @quiz = quizzes(:one)
  end

  test "visiting the index" do
    visit quizzes_url
    assert_selector "h1", text: "Quizzes"
  end

  test "creating a Quiz" do
    visit quizzes_url
    click_on "New Quiz"

    fill_in "Correct response", with: @quiz.correct_response
    fill_in "Lesson", with: @quiz.lesson_id
    fill_in "Option1", with: @quiz.option1
    fill_in "Option2", with: @quiz.option2
    fill_in "Option3", with: @quiz.option3
    fill_in "Option4", with: @quiz.option4
    fill_in "Question", with: @quiz.question
    click_on "Create Quiz"

    assert_text "Quiz was successfully created"
    click_on "Back"
  end

  test "updating a Quiz" do
    visit quizzes_url
    click_on "Edit", match: :first

    fill_in "Correct response", with: @quiz.correct_response
    fill_in "Lesson", with: @quiz.lesson_id
    fill_in "Option1", with: @quiz.option1
    fill_in "Option2", with: @quiz.option2
    fill_in "Option3", with: @quiz.option3
    fill_in "Option4", with: @quiz.option4
    fill_in "Question", with: @quiz.question
    click_on "Update Quiz"

    assert_text "Quiz was successfully updated"
    click_on "Back"
  end

  test "destroying a Quiz" do
    visit quizzes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quiz was successfully destroyed"
  end
end
