class LDAPService

  def initialize
    ldap_connector.connect rescue return
  end

  def ldap_connector
    @ldap_connector ||= LDAPConnector.new
  end

  def refresh_user(user)
    Rails.logger.info "Refreshing user #{user.email}..."

    ldap_filter = ldap_connector.create_filter('mail', user.email.downcase)
    ldap_result = ldap_connector.search_one(ldap_filter, ENV['LDAP_TREEBASE'])

    if ldap_result.mobile.first
      user.mobile = ldap_result.mobile.first
    end

    if ldap_result.company.first
      user.company = ldap_result.company.first
    end
    user.save!
  rescue StandardError => e
    Rails.logger.warn "Could not refesh user #{user.email}, #{e}"
  end

end
