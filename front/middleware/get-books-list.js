export default async ({ store,$axios }) => {
  // await $axios.$get('/api/v1/projects',{ headers: {'X-Requested-With': null} })
  // プロジェクト一覧が存在しない場合
  if (!store.state.project.list.length) {
    await $axios.$get('/api/v1/projects')
      .then(projects => store.dispatch('getProjectList', projects))
  }
}
