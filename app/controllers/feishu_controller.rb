class FeishuController < ApplicationController # :nodoc:
  skip_before_action :authenticate_user!

  ## POST /feishu/card
  def card
    case event_type
    when 'url_verification'
      redner json: { challenge: params[:challenge] }
    else
      redner json: { ok: 'ok' }
    end
  end

  private

  def event_type
    if params['schema'] == '2.0'
      params[:header]['event_type']
    else
      params[:type]
    end
  end
end
