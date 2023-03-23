const MUTATION = /* GraphQL */ `
  mutation SigninUser {
    signinUser(input: {}) {
      user {
        uid
      }
    }
  }
`
export default MUTATION
