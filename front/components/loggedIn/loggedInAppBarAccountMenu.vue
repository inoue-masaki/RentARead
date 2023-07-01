<template>

    <v-menu
      app
      offset-x
      offset-y
      max-width="200"
    >
      <template v-slot:activator="{ on }">
        <v-btn
          icon
          v-on="on"
        >
          <v-icon>
            mdi-account-circle
          </v-icon>
        </v-btn>
      </template>
      <v-list dense>
        <v-subheader>
          {{ $t(`pages.account.login-user`) }}
        </v-subheader>

        <v-list-item>
          <v-list-item-content>
            <v-list-item-subtitle>
              {{ this.logged_in_user_name }}
            </v-list-item-subtitle>
          </v-list-item-content>
        </v-list-item>

        <v-divider />

        <v-subheader>
          {{ $t(`pages.account.name`)}}
        </v-subheader>

        <v-card
          class="mx-auto"
          max-width="300"
          tile
        >
          <v-list dense>
            <v-list-item-group
              v-model="selectedItem"
            >
              <v-list-item
                v-for="(menu, i) in menus"
                :key="i"
                :to="menu.root"
              >
                <v-list-item-icon>
                  <v-icon v-text="menu.icon"></v-icon>
                </v-list-item-icon>
                <v-list-item-content>
                  <v-list-item-title>
                      {{ $t(`pages.account.${menu.name}`) }}
                  </v-list-item-title>
                </v-list-item-content>
              </v-list-item>
            </v-list-item-group>
          </v-list>
        </v-card>
      </v-list>
    </v-menu>

</template>

<script>
export default {
  data({ $store }){
    return {
      logged_in_user_name: $store.state.user.current.name,
      selectedItem: 1,
      menus: [
        // { name: 'settings', icon: 'mdi-account-cog',root: '/account/settings'},
        // { name: 'password', icon: 'mdi-lock-outline',root: '/account/password'},
        { name: 'logout', icon: 'mdi-logout-variant',root: '/logout',divider: true},
      ],
      homePath: $store.state.loggedIn.homePath,
    }
  }
}
</script>