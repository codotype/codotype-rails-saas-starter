module.exports = {
  name: 'Rails Saas Starter',
  async write () {
    await this.composeWith('./base')
    await this.composeWith('./routes')
    await this.composeWith('./navbar')
    await this.composeWith('./crud')
    await this.composeWith('./views')
    await this.composeWith('./migrations')
  }
}
