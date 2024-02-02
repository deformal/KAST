async function main(): Promise<number> {
  const word = 'hello world'
  console.log(word)
  return 0
}

main().catch((err) => {
  console.error(err)
})
