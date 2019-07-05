module.exports = {
  name: 'LimestoneBase',
  async write () {
    await this.copyDir({ src: '', dest: '' })
  }
}
