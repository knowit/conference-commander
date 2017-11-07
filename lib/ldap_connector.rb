class LDAPConnector

  def connect
    @ldap = Net::LDAP.new(
      host: ENV['LDAP_HOST'],
      port: 389,
      auth: {
        method: :simple,
        username: ENV['LDAP_USERNAME'],
        password: ENV['LDAP_PASSWORD']
      }
    )
  end

  def create_filter(type, value)
    Net::LDAP::Filter.eq(type, value)
  end

  def search_one(ldap_filter, treebase)
    search_all(ldap_filter, treebase).first
  end

  def search_all(ldap_filter, treebase)
    if ldap_filter
      @ldap.search(base: treebase, filter: ldap_filter)
    else
      @ldap.search(base: treebase)
    end
  end
end
