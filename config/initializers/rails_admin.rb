RailsAdmin.config do |config|
  config.authenticate_with do
    warden.authenticate! scope: :admin_user
  end
  config.current_user_method(&:current_admin_user)

  config.audit_with :paper_trail, 'AdminUser', 'PaperTrail::Version'

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    # With an audit adapter, you can add:
    PAPER_TRAILED = ['BrokerageUser']
    history_index { only PAPER_TRAILED }
    history_show { only PAPER_TRAILED }
  end
end
