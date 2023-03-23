const MUTATION = /* GraphQL */ `
  mutation SendQuestion($question: String!) {
    sendQuestion(input: { question: $question }) {
      answer
    }
  }
`
export default MUTATION
