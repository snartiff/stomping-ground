class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review

    mail(
      to: @review.district.user.email,
      subject: "New Review for #{review.district.name}"
    )
  end
end
