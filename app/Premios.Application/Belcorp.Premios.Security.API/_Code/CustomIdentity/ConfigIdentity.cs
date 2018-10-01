namespace Belcorp.Premios.Security.API.CustomIdentity
{
    using Belcorp.Premios.Infrastructure.CrossCutting.AppSettingModel;
    using Belcorp.Premios.Infrastructure.CrossCutting.Constants;
    using IdentityServer4;
    using IdentityServer4.Models;
    using Microsoft.Extensions.Configuration;
    using Microsoft.Extensions.Options;
    using System.Collections.Generic;

    public static class ConfigIdentity
    {
        private static IConfiguration _configuration;

        public static void Init(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public static IEnumerable<IdentityResource> GetIdentityResources()
        {
            return new List<IdentityResource>() {
                new IdentityResources.OpenId(),
                new IdentityResources.Profile(),
                new IdentityResources.Email(),
                //new IdentityResource("apiProtocolsscope2",new []{ "role", "admin", "user", "apiProtocols", "apiProtocols.admin" , "apiProtocols.user" } )
                //new IdentityResource("apiProtocolsscope2",new []{ "apiProtocols" } )
            };
        }

        public static IEnumerable<ApiResource> GetApiResources()
        {
            return new List<ApiResource>
            {
                new ApiResource(Constants.IdentityServer.API_RESOURCE_PROTOCOLS)
                {
                    ApiSecrets =
                    {
                        new Secret(_configuration["IdentityServer:ApiResourceProtocolsSecret"].Sha256())
                    },
                    Scopes =
                    {
                        new Scope
                        {
                            Name = Constants.IdentityServer.API_RESOURCE_PROTOCOLS_SCOPE,
                            DisplayName = "Scope for the apiProtocols ApiResource"
                        }
                    },
                    UserClaims = { "name", "role", "admin", "user", Constants.IdentityServer.API_RESOURCE_PROTOCOLS }
                },
                //new ApiResource(Constants.IdentityServer.API_RESOURCE_REPORTS)
                //{
                //    ApiSecrets =
                //    {
                //        new Secret(_configuration["IdentityServer:ApiResourceReportsSecret"].Sha256())
                //    },
                //    Scopes =
                //    {
                //        new Scope
                //        {
                //            Name = Constants.IdentityServer.API_RESOURCE_REPORTS_SCOPE,
                //            DisplayName = "Scope for the apiReports ApiResource"
                //        }
                //    },
                //    UserClaims = { "name", "role", "admin", "user", Constants.IdentityServer.API_RESOURCE_REPORTS }
                //},
                new ApiResource(Constants.IdentityServer.API_RESOURCE_SECURITY)
                {
                    ApiSecrets =
                    {
                        new Secret(_configuration["IdentityServer:ApiResourceIdentitySecret"].Sha256())
                    },
                    Scopes =
                    {
                        new Scope
                        {
                            Name = Constants.IdentityServer.API_RESOURCE_SECURITY_SCOPE,
                            DisplayName = "Scope for the apiSecurity ApiResource"
                        }
                    },
                    UserClaims = { "name", "role", "admin", "user", Constants.IdentityServer.API_RESOURCE_SECURITY }
                }
            };
        }


        public static IEnumerable<Client> GetClients()
        {
            return new List<Client>()
            {
                new Client
                {
                    ClientId = Constants.IdentityServer.CLIENT_ID,
                    AllowedGrantTypes = GrantTypes.ResourceOwnerPassword,
                    AlwaysIncludeUserClaimsInIdToken = true,
                    
                    // Client secrets
                    ClientSecrets =
                    {
                        new Secret(_configuration["IdentityServer:ClientSecret"].Sha256())
                    },
                    AllowedScopes = {
                        IdentityServerConstants.StandardScopes.OpenId,
                        IdentityServerConstants.StandardScopes.Profile,
                        IdentityServerConstants.StandardScopes.Email,
                        IdentityServerConstants.StandardScopes.OfflineAccess,
                        Constants.IdentityServer.API_RESOURCE_PROTOCOLS, Constants.IdentityServer.API_RESOURCE_SECURITY
                    }
                },
                new Client
                {
                    ClientId = Constants.IdentityServer.CLIENT_TOKEN_ID,
                   // AllowedGrantTypes = GrantTypes.HybridAndClientCredentials,
                    AllowedGrantTypes = GrantTypes.ResourceOwnerPassword,
                    AlwaysIncludeUserClaimsInIdToken = true,
                   //AllowedGrantTypes = GrantTypes.ResourceOwnerPasswordAndClientCredentials,
                    //AllowedGrantTypes = GrantTypes.ClientCredentials,
                    AccessTokenType = AccessTokenType.Jwt,
                    AccessTokenLifetime = int.Parse(_configuration["IdentityServer:AccessTokenLifetime"]),
                    IdentityTokenLifetime = int.Parse(_configuration["IdentityServer:IdentityTokenLifetime"]),
                    UpdateAccessTokenClaimsOnRefresh = true,
                    SlidingRefreshTokenLifetime = 30,
                    AllowOfflineAccess = true,
                    RefreshTokenExpiration = TokenExpiration.Absolute,
                    RefreshTokenUsage = TokenUsage.OneTimeOnly,
                    AlwaysSendClientClaims = true,
                    Enabled = true,
                    ClientSecrets =  new List<Secret> { new Secret(_configuration["IdentityServer:ResourceOwnerClientSecret"].Sha256()) },
                    AllowedScopes = {
                        IdentityServerConstants.StandardScopes.OpenId,
                        IdentityServerConstants.StandardScopes.Profile,
                        IdentityServerConstants.StandardScopes.Email,
                        IdentityServerConstants.StandardScopes.OfflineAccess,
                        Constants.IdentityServer.API_RESOURCE_PROTOCOLS, Constants.IdentityServer.API_RESOURCE_SECURITY
                    }
                }
            };
        }
    }
}
