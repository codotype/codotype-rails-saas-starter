
module.exports = {
  name: 'Routes.rb',
  async write({ blueprint, configuration }) {
    await this.renderComponent({
      src: 'routes.rb',
      dest: 'config/routes.rb'
    });
  }
}
