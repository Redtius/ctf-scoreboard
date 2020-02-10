# frozen_string_literal: true

module TeamsHelper
  def display_name(team)
    return team.team_name if team.eligible?

    "#{team.team_name} (ineligible)"
  end

  def category_header(game)
    return 'Defense Team' if game.is_a?(PentestGame)

    'Category'
  end

  def solved_challenge_title(game, solved_challenge)
    return solved_challenge.flag.team.team_name if game.is_a?(PentestGame)

    solved_challenge.challenge.category.name
  end

  def eligible?(user_request)
    return t('teams.show.eligible') if user_request.user.compete_for_prizes

    t('teams.show.ineligible')
  end
end
