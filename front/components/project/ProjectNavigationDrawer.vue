<template>
    <v-navigation-drawer
      app
      clipped
    >
      <v-list>
        <v-list-item
        v-for="(nav, i) in navMenus"
        :key="`nav-${i}`"
        :to="nav.root"
      >
        <v-list-item-icon>
          <v-icon v-text="nav.icon" />
        </v-list-item-icon>

        <v-list-item-content>
          <v-list-item-title>
            {{ $t(`kind.${nav.name}`) }}
          </v-list-item-title>
        </v-list-item-content>
      </v-list-item>
      </v-list>
    </v-navigation-drawer>
  </template>

<script>
export default {
  data () {
    return {
      mobileBreakpoint: 960,
      navMenus: [
        { name: 'literture', icon: 'mdi-pencil',root: '/kind/literture' },
        { name: 'humanities', icon: 'mdi-account-edit',root: '/kind/humanities' },
        { name: 'politics', icon: 'mdi-bank',root: '/kind/politics' },
        { name: 'nonfiction', icon: 'mdi-eye',root: '/kind/nonfiction' },
        { name: 'history', icon: 'mdi-earth',root: '/kind/history' },
        { name: 'bussiness', icon: 'mdi-cash-100' ,root: '/kind/bussiness' },
        { name: 'invest', icon: 'mdi-family-tree',root: '/kind/invest' },
        { name: 'language', icon: 'mdi-book-alphabet',root: '/kind/language' },
        { name: 'english', icon: 'mdi-ab-testing',root: '/kind/english' },
        { name: 'education', icon: 'mdi-account-school',root: '/kind/education' },
        { name: 'children', icon: 'mdi-baby-face-outline',root: '/kind/children' },
        { name: 'sience', icon: 'mdi-atom',root: '/kind/sience' },
        { name: 'medical', icon: 'mdi-flask-empty-outline',root: '/kind/medical' },
        { name: 'it', icon: 'mdi-laptop',root: '/kind/it' },
        { name: 'art', icon: 'mdi-palette-outline',root: '/kind/art' },
        { name: 'comic', icon: 'mdi-google-downasaur',root: '/kind/comic' },
        { name: 'lightnovel', icon: 'mdi-sword',root: '/kind/lightnovel' },
        { name: 'boyslove', icon: 'mdi-cards-heart',root: '/kind/boyslove' },
        { name: 'talent', icon: 'mdi-face-woman-shimmer',root: '/kind/talent' },
        { name: 'game', icon: 'mdi-microsoft-xbox-controller',root: '/kind/game' },
        { name: 'entertainment', icon: 'mdi-party-popper',root: '/kind/entertainment' },
        { name: 'novel', icon: 'mdi-book-outline',root: '/kind/novel' },
        { name: 'magazine', icon: 'mdi-book-open-page-variant',root: '/kind/magazine' },
        { name: 'hobby', icon: 'mdi-hammer-wrench',root: '/kind/' },
        { name: 'sport', icon: 'mdi-baseball-bat',root: '/kind/sport' },
        { name: 'work', icon: 'mdi-account-tie',root: '/kind/work' },
        { name: 'life', icon: 'mdi-face-man',root: '/kind/life' },
        { name: 'travel', icon: 'mdi-airplane',root: '/kind/travel' },
        { name: 'score', icon: 'mdi-playlist-music',root: '/kind/score' },
        { name: 'calender', icon: 'mdi-calendar-today',root: '/kind/calender' },
        { name: 'poster', icon: 'mdi-panorama-variant-outline',root: '/kind/poster' },
        { name: 'second', icon: 'mdi-bookshelf',root: '/kind/second' },
        { name: 'legacy', icon: 'mdi-star-four-points-outline',root: '/kind/legacy' }
      ]
    }
  },
  computed: {
    setDrawer: {
      get () {return this.drawer},
      set (newVal) {return this.$emit('update:drawer,newVal')}
    },
    isMobileBreakpointLessThan(){
      const windowWidth = this.$vuetify.breakpoint.windowWidth
      return this.mobileBreakpoint
    }
  }
}
</script>