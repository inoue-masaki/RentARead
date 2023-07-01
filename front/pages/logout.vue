<script>
export default {
  layout: 'logged-in',
  async middleware ({ $auth, redirect }) {
    await $auth.logout()
    return redirect('/')
  }
}
</script>