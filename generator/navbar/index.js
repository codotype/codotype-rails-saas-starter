
module.exports = {
  name: 'Navbar',
  async write ({ blueprint }) {
    await this.renderComponent({
      src: 'navbar_loggedin.haml',
      dest: 'app/views/layouts/_navbar_loggedin.haml',
    });
  }
}